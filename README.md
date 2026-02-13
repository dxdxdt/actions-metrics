# Github Actions Metrics
Information on Github hosted runners like the Azure region they run on is
necessary info when optimising CD/CI pipelines(especially network latencies and
route path bandwidth). Github does not disclose it so I did it myself.

Using this info, place the resources(DB, object storage, other instances) near
the runners are usually run.

A few pieces of info I could gather online:

- Azure doesn't provide a list of VM service endpoints like AWS
- Github-hosted Actions runners are actually Azure VMs (surprisingly, not in a
  container)
- Github is hosted in the data centre somewhere in the US, probably in the same
  data centre where Azure is present

Microsoft definitely has more points of presence than any other cloud service
providers, but there's no official list of data center endpoints to ping. If you
look at the map,

<a href="https://aws.amazon.com/about-aws/global-infrastructure/regions_az/">
<img src="image.png" style="width: 500px;">
</a>
<a href="https://datacenters.microsoft.com/globe/explore">
<img src="image-1.png" style="width: 500px;">
</a>

they're close enough. For most devs, all that matters is probably how close
their S3 buckets are to the Github Actions runners. Some AWS and Azure regions
are under the same roof, but then again, no official data.

## DATA
Updated: 2026-02-13T19:37:33.531087+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.958 |  |
| ap-east-1 | 0.725 |  |
| ap-northeast-1 | 0.548 |  |
| ap-northeast-2 | 0.653 |  |
| ap-south-1 | 0.913 |  |
| ap-south-2 | 0.909 |  |
| ap-southeast-1 | 0.797 |  |
| ap-southeast-2 | 0.720 |  |
| ap-southeast-3 | 0.860 |  |
| ap-southeast-4 | 0.765 |  |
| ap-southeast-5 | 0.761 |  |
| ap-southeast-6 | 0.772 |  |
| ca-central-1 | 0.168 | 16 |
| ca-west-1 | 0.243 |  |
| eu-central-1 | 0.470 |  |
| eu-central-2 | 0.492 |  |
| eu-north-1 | 0.518 |  |
| eu-south-1 | 0.496 |  |
| eu-south-2 | 0.523 |  |
| eu-west-1 | 0.383 |  |
| eu-west-2 | 0.431 |  |
| eu-west-3 | 0.447 |  |
| il-central-1 | 0.642 |  |
| me-central-1 | 0.847 |  |
| me-south-1 | 0.816 |  |
| sa-east-1 | 0.576 |  |
| us-east-1 | 0.130 | 4117 |
| us-east-2 | 0.115 | 1339 |
| us-gov-east-1 | 0.124 | 1457 |
| us-gov-west-1 | 0.211 | 147 |
| us-west-1 | 0.214 | 3054 |
| us-west-2 | 0.211 | 125 |


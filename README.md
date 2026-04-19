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
Updated: 2026-04-19T11:29:42.759024+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.980 |  |
| ap-east-1 | 0.730 |  |
| ap-east-2 | 0.661 |  |
| ap-northeast-1 | 0.548 |  |
| ap-northeast-2 | 0.647 |  |
| ap-northeast-3 | 0.569 |  |
| ap-south-1 | 0.905 |  |
| ap-south-2 | 0.968 |  |
| ap-southeast-1 | 0.804 |  |
| ap-southeast-2 | 0.702 |  |
| ap-southeast-3 | 0.854 |  |
| ap-southeast-4 | 0.740 |  |
| ap-southeast-5 | 0.818 |  |
| ap-southeast-6 | 0.730 |  |
| ap-southeast-7 | 0.904 |  |
| ca-central-1 | 0.153 | 16 |
| ca-west-1 | 0.226 |  |
| eu-central-1 | 0.498 |  |
| eu-central-2 | 0.512 |  |
| eu-north-1 | 0.540 |  |
| eu-south-1 | 0.512 |  |
| eu-south-2 | 0.535 |  |
| eu-west-1 | 0.428 |  |
| eu-west-2 | 0.443 |  |
| eu-west-3 | 0.484 |  |
| il-central-1 | 0.662 |  |
| me-central-1 | 0.871 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.204 |  |
| sa-east-1 | 0.595 |  |
| us-east-1 | 0.124 | 4525 |
| us-east-2 | 0.099 | 1515 |
| us-gov-east-1 | 0.115 | 1656 |
| us-gov-west-1 | 0.214 | 194 |
| us-west-1 | 0.165 | 3440 |
| us-west-2 | 0.214 | 156 |


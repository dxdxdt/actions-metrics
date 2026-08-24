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
Updated: 2026-08-24T00:47:46.815717+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.946 |  |
| ap-east-1 | 0.716 |  |
| ap-east-2 | 0.657 |  |
| ap-northeast-1 | 0.536 |  |
| ap-northeast-2 | 0.643 |  |
| ap-northeast-3 | 0.564 |  |
| ap-south-1 | 0.909 |  |
| ap-south-2 | 0.966 |  |
| ap-southeast-1 | 0.792 |  |
| ap-southeast-2 | 0.700 |  |
| ap-southeast-3 | 0.847 |  |
| ap-southeast-4 | 0.740 |  |
| ap-southeast-5 | 0.812 |  |
| ap-southeast-6 | 0.720 |  |
| ap-southeast-7 | 0.895 |  |
| ca-central-1 | 0.143 | 18 |
| ca-west-1 | 0.222 |  |
| eu-central-1 | 0.461 |  |
| eu-central-2 | 0.483 |  |
| eu-north-1 | 0.509 |  |
| eu-south-1 | 0.488 |  |
| eu-south-2 | 0.500 |  |
| eu-west-1 | 0.391 |  |
| eu-west-2 | 0.405 |  |
| eu-west-3 | 0.435 |  |
| il-central-1 | 0.635 |  |
| me-central-1 | 0.825 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.188 |  |
| sa-east-1 | 0.615 |  |
| us-east-1 | 0.135 | 5050 |
| us-east-2 | 0.126 | 1682 |
| us-gov-east-1 | 0.104 | 1875 |
| us-gov-west-1 | 0.211 | 226 |
| us-west-1 | 0.155 | 4041 |
| us-west-2 | 0.212 | 185 |


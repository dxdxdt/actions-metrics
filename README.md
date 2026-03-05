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
Updated: 2026-03-05T10:32:27.574004+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.938 |  |
| ap-east-1 | 0.738 |  |
| ap-east-2 | 0.692 |  |
| ap-northeast-1 | 0.572 |  |
| ap-northeast-2 | 0.673 |  |
| ap-northeast-3 | 0.593 |  |
| ap-south-1 | 0.897 |  |
| ap-south-2 | 0.917 |  |
| ap-southeast-1 | 0.833 |  |
| ap-southeast-2 | 0.710 |  |
| ap-southeast-3 | 0.871 |  |
| ap-southeast-4 | 0.750 |  |
| ap-southeast-5 | 0.835 |  |
| ap-southeast-6 | 0.799 |  |
| ap-southeast-7 | 0.923 |  |
| ca-central-1 | 0.176 | 16 |
| ca-west-1 | 0.257 |  |
| eu-central-1 | 0.468 |  |
| eu-central-2 | 0.483 |  |
| eu-north-1 | 0.505 |  |
| eu-south-1 | 0.490 |  |
| eu-south-2 | 0.496 |  |
| eu-west-1 | 0.378 |  |
| eu-west-2 | 0.421 |  |
| eu-west-3 | 0.453 |  |
| il-central-1 | 0.641 |  |
| me-central-1 | 0.851 |  |
| me-south-1 | 0.819 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.553 |  |
| us-east-1 | 0.123 | 4224 |
| us-east-2 | 0.146 | 1399 |
| us-gov-east-1 | 0.144 | 1531 |
| us-gov-west-1 | 0.243 | 170 |
| us-west-1 | 0.182 | 3176 |
| us-west-2 | 0.248 | 141 |


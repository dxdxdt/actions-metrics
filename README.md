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
Updated: 2026-03-21T23:18:18.859926+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.004 |  |
| ap-east-1 | 0.708 |  |
| ap-east-2 | 0.652 |  |
| ap-northeast-1 | 0.527 |  |
| ap-northeast-2 | 0.631 |  |
| ap-northeast-3 | 0.552 |  |
| ap-south-1 | 0.873 |  |
| ap-south-2 | 0.871 |  |
| ap-southeast-1 | 0.779 |  |
| ap-southeast-2 | 0.673 |  |
| ap-southeast-3 | 0.833 |  |
| ap-southeast-4 | 0.716 |  |
| ap-southeast-5 | 0.798 |  |
| ap-southeast-6 | 0.716 |  |
| ap-southeast-7 | 0.880 |  |
| ca-central-1 | 0.209 | 16 |
| ca-west-1 | 0.208 |  |
| eu-central-1 | 0.493 |  |
| eu-central-2 | 0.533 |  |
| eu-north-1 | 0.553 |  |
| eu-south-1 | 0.518 |  |
| eu-south-2 | 0.530 |  |
| eu-west-1 | 0.417 |  |
| eu-west-2 | 0.452 |  |
| eu-west-3 | 0.492 |  |
| il-central-1 | 0.686 |  |
| me-central-1 | 0.878 |  |
| me-south-1 | 0.832 |  |
| mx-central-1 | 0.252 |  |
| sa-east-1 | 0.607 |  |
| us-east-1 | 0.181 | 4324 |
| us-east-2 | 0.172 | 1446 |
| us-gov-east-1 | 0.169 | 1594 |
| us-gov-west-1 | 0.192 | 189 |
| us-west-1 | 0.154 | 3275 |
| us-west-2 | 0.190 | 151 |


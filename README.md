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
Updated: 2026-07-01T21:20:44.561867+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.986 |  |
| ap-east-1 | 0.684 |  |
| ap-east-2 | 0.622 |  |
| ap-northeast-1 | 0.504 |  |
| ap-northeast-2 | 0.608 |  |
| ap-northeast-3 | 0.530 |  |
| ap-south-1 | 0.896 |  |
| ap-south-2 | 0.877 |  |
| ap-southeast-1 | 0.760 |  |
| ap-southeast-2 | 0.662 |  |
| ap-southeast-3 | 0.822 |  |
| ap-southeast-4 | 0.708 |  |
| ap-southeast-5 | 0.785 |  |
| ap-southeast-6 | 0.701 |  |
| ap-southeast-7 | 0.867 |  |
| ca-central-1 | 0.243 | 16 |
| ca-west-1 | 0.223 |  |
| eu-central-1 | 0.508 |  |
| eu-central-2 | 0.550 |  |
| eu-north-1 | 0.555 |  |
| eu-south-1 | 0.555 |  |
| eu-south-2 | 0.538 |  |
| eu-west-1 | 0.439 |  |
| eu-west-2 | 0.465 |  |
| eu-west-3 | 0.493 |  |
| il-central-1 | 0.683 |  |
| me-central-1 | 0.890 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.208 |  |
| sa-east-1 | 0.624 |  |
| us-east-1 | 0.184 | 4808 |
| us-east-2 | 0.191 | 1649 |
| us-gov-east-1 | 0.183 | 1727 |
| us-gov-west-1 | 0.192 | 200 |
| us-west-1 | 0.139 | 3726 |
| us-west-2 | 0.193 | 164 |


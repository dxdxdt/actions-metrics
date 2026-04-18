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
Updated: 2026-04-18T14:38:03.615113+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.921 |  |
| ap-east-1 | 0.754 |  |
| ap-east-2 | 0.698 |  |
| ap-northeast-1 | 0.574 |  |
| ap-northeast-2 | 0.690 |  |
| ap-northeast-3 | 0.599 |  |
| ap-south-1 | 0.876 |  |
| ap-south-2 | 0.957 |  |
| ap-southeast-1 | 0.830 |  |
| ap-southeast-2 | 0.740 |  |
| ap-southeast-3 | 0.906 |  |
| ap-southeast-4 | 0.787 |  |
| ap-southeast-5 | 0.852 |  |
| ap-southeast-6 | 0.793 |  |
| ap-southeast-7 | 0.935 |  |
| ca-central-1 | 0.164 | 16 |
| ca-west-1 | 0.287 |  |
| eu-central-1 | 0.427 |  |
| eu-central-2 | 0.454 |  |
| eu-north-1 | 0.491 |  |
| eu-south-1 | 0.460 |  |
| eu-south-2 | 0.469 |  |
| eu-west-1 | 0.356 |  |
| eu-west-2 | 0.397 |  |
| eu-west-3 | 0.413 |  |
| il-central-1 | 0.627 |  |
| me-central-1 | 0.812 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.228 |  |
| sa-east-1 | 0.543 |  |
| us-east-1 | 0.104 | 4522 |
| us-east-2 | 0.116 | 1510 |
| us-gov-east-1 | 0.135 | 1655 |
| us-gov-west-1 | 0.269 | 194 |
| us-west-1 | 0.217 | 3433 |
| us-west-2 | 0.267 | 156 |


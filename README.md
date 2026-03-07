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
Updated: 2026-03-07T07:23:51.548387+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.004 |  |
| ap-east-1 | 0.699 |  |
| ap-east-2 | 0.645 |  |
| ap-northeast-1 | 0.524 |  |
| ap-northeast-2 | 0.631 |  |
| ap-northeast-3 | 0.549 |  |
| ap-south-1 | 0.899 |  |
| ap-south-2 | 0.924 |  |
| ap-southeast-1 | 0.779 |  |
| ap-southeast-2 | 0.671 |  |
| ap-southeast-3 | 0.829 |  |
| ap-southeast-4 | 0.715 |  |
| ap-southeast-5 | 0.797 |  |
| ap-southeast-6 | 0.750 |  |
| ap-southeast-7 | 0.876 |  |
| ca-central-1 | 0.189 | 16 |
| ca-west-1 | 0.189 |  |
| eu-central-1 | 0.514 |  |
| eu-central-2 | 0.526 |  |
| eu-north-1 | 0.555 |  |
| eu-south-1 | 0.532 |  |
| eu-south-2 | 0.544 |  |
| eu-west-1 | 0.428 |  |
| eu-west-2 | 0.460 |  |
| eu-west-3 | 0.489 |  |
| il-central-1 | 0.671 |  |
| me-central-1 | 0.878 |  |
| me-south-1 | 0.845 |  |
| mx-central-1 | 0.265 |  |
| sa-east-1 | 0.611 |  |
| us-east-1 | 0.164 | 4233 |
| us-east-2 | 0.138 | 1406 |
| us-gov-east-1 | 0.134 | 1535 |
| us-gov-west-1 | 0.177 | 174 |
| us-west-1 | 0.171 | 3189 |
| us-west-2 | 0.175 | 142 |


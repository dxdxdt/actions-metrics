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
Updated: 2026-06-09T07:39:41.315851+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.048 |  |
| ap-east-1 | 0.650 |  |
| ap-east-2 | 0.585 |  |
| ap-northeast-1 | 0.472 |  |
| ap-northeast-2 | 0.578 |  |
| ap-northeast-3 | 0.496 |  |
| ap-south-1 | 0.911 |  |
| ap-south-2 | 0.892 |  |
| ap-southeast-1 | 0.730 |  |
| ap-southeast-2 | 0.621 |  |
| ap-southeast-3 | 0.790 |  |
| ap-southeast-4 | 0.659 |  |
| ap-southeast-5 | 0.752 |  |
| ap-southeast-6 | 0.652 |  |
| ap-southeast-7 | 0.837 |  |
| ca-central-1 | 0.281 | 16 |
| ca-west-1 | 0.216 |  |
| eu-central-1 | 0.552 |  |
| eu-central-2 | 0.581 |  |
| eu-north-1 | 0.591 |  |
| eu-south-1 | 0.597 |  |
| eu-south-2 | 0.576 |  |
| eu-west-1 | 0.471 |  |
| eu-west-2 | 0.516 |  |
| eu-west-3 | 0.526 |  |
| il-central-1 | 0.707 |  |
| me-central-1 | 0.948 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.665 |  |
| us-east-1 | 0.226 | 4735 |
| us-east-2 | 0.205 | 1629 |
| us-gov-east-1 | 0.205 | 1709 |
| us-gov-west-1 | 0.148 | 198 |
| us-west-1 | 0.091 | 3651 |
| us-west-2 | 0.145 | 162 |


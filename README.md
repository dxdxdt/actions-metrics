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
Updated: 2026-10-10T16:03:48.197724+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.039 |  |
| ap-east-1 | 0.637 |  |
| ap-east-2 | 0.572 |  |
| ap-northeast-1 | 0.454 |  |
| ap-northeast-2 | 0.558 |  |
| ap-northeast-3 | 0.480 |  |
| ap-south-1 | 0.911 |  |
| ap-south-2 | 0.884 |  |
| ap-southeast-1 | 0.715 |  |
| ap-southeast-2 | 0.597 |  |
| ap-southeast-3 | 0.768 |  |
| ap-southeast-4 | 0.645 |  |
| ap-southeast-5 | 0.731 |  |
| ap-southeast-6 | 0.667 |  |
| ap-southeast-7 | 0.812 |  |
| ca-central-1 | 0.273 | 18 |
| ca-west-1 | 0.220 |  |
| eu-central-1 | 0.556 |  |
| eu-central-2 | 0.575 |  |
| eu-north-1 | 0.615 |  |
| eu-south-1 | 0.592 |  |
| eu-south-2 | 0.568 |  |
| eu-west-1 | 0.482 |  |
| eu-west-2 | 0.518 |  |
| eu-west-3 | 0.533 |  |
| il-central-1 | 0.728 |  |
| me-central-1 | 0.962 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.233 |  |
| sa-east-1 | 0.670 |  |
| us-east-1 | 0.232 | 5143 |
| us-east-2 | 0.241 | 1693 |
| us-gov-east-1 | 0.239 | 1936 |
| us-gov-west-1 | 0.135 | 237 |
| us-west-1 | 0.072 | 4165 |
| us-west-2 | 0.135 | 194 |


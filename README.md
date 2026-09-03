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
Updated: 2026-09-03T07:33:44.353147+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.984 |  |
| ap-east-1 | 0.706 |  |
| ap-east-2 | 0.649 |  |
| ap-northeast-1 | 0.528 |  |
| ap-northeast-2 | 0.632 |  |
| ap-northeast-3 | 0.555 |  |
| ap-south-1 | 0.879 |  |
| ap-south-2 | 0.952 |  |
| ap-southeast-1 | 0.800 |  |
| ap-southeast-2 | 0.679 |  |
| ap-southeast-3 | 0.841 |  |
| ap-southeast-4 | 0.720 |  |
| ap-southeast-5 | 0.803 |  |
| ap-southeast-6 | 0.709 |  |
| ap-southeast-7 | 0.884 |  |
| ca-central-1 | 0.181 | 18 |
| ca-west-1 | 0.220 |  |
| eu-central-1 | 0.496 |  |
| eu-central-2 | 0.505 |  |
| eu-north-1 | 0.539 |  |
| eu-south-1 | 0.517 |  |
| eu-south-2 | 0.533 |  |
| eu-west-1 | 0.405 |  |
| eu-west-2 | 0.454 |  |
| eu-west-3 | 0.465 |  |
| il-central-1 | 0.643 |  |
| me-central-1 | 0.876 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.211 |  |
| sa-east-1 | 0.605 |  |
| us-east-1 | 0.148 | 5080 |
| us-east-2 | 0.156 | 1685 |
| us-gov-east-1 | 0.138 | 1893 |
| us-gov-west-1 | 0.199 | 230 |
| us-west-1 | 0.144 | 4077 |
| us-west-2 | 0.199 | 191 |


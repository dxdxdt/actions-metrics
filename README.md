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
Updated: 2026-08-09T08:32:59.031219+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.924 |  |
| ap-east-1 | 0.758 |  |
| ap-east-2 | 0.686 |  |
| ap-northeast-1 | 0.575 |  |
| ap-northeast-2 | 0.679 |  |
| ap-northeast-3 | 0.595 |  |
| ap-south-1 | 0.876 |  |
| ap-south-2 | 0.967 |  |
| ap-southeast-1 | 0.832 |  |
| ap-southeast-2 | 0.724 |  |
| ap-southeast-3 | 0.887 |  |
| ap-southeast-4 | 0.768 |  |
| ap-southeast-5 | 0.853 |  |
| ap-southeast-6 | 0.785 |  |
| ap-southeast-7 | 0.935 |  |
| ca-central-1 | 0.151 | 18 |
| ca-west-1 | 0.220 |  |
| eu-central-1 | 0.428 |  |
| eu-central-2 | 0.448 |  |
| eu-north-1 | 0.482 |  |
| eu-south-1 | 0.464 |  |
| eu-south-2 | 0.486 |  |
| eu-west-1 | 0.370 |  |
| eu-west-2 | 0.404 |  |
| eu-west-3 | 0.425 |  |
| il-central-1 | 0.600 |  |
| me-central-1 | 0.827 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.223 |  |
| sa-east-1 | 0.562 |  |
| us-east-1 | 0.095 | 4960 |
| us-east-2 | 0.113 | 1677 |
| us-gov-east-1 | 0.104 | 1811 |
| us-gov-west-1 | 0.249 | 214 |
| us-west-1 | 0.192 | 3909 |
| us-west-2 | 0.248 | 175 |


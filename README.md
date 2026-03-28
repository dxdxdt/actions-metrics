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
Updated: 2026-03-28T11:22:50.849325+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.895 |  |
| ap-east-1 | 0.805 |  |
| ap-east-2 | 0.732 |  |
| ap-northeast-1 | 0.629 |  |
| ap-northeast-2 | 0.730 |  |
| ap-northeast-3 | 0.650 |  |
| ap-south-1 | 0.833 |  |
| ap-south-2 | 0.899 |  |
| ap-southeast-1 | 0.875 |  |
| ap-southeast-2 | 0.804 |  |
| ap-southeast-3 | 0.940 |  |
| ap-southeast-4 | 0.844 |  |
| ap-southeast-5 | 0.884 |  |
| ap-southeast-6 | 0.838 |  |
| ap-southeast-7 | 0.987 |  |
| ca-central-1 | 0.124 | 16 |
| ca-west-1 | 0.279 |  |
| eu-central-1 | 0.407 |  |
| eu-central-2 | 0.420 |  |
| eu-north-1 | 0.461 |  |
| eu-south-1 | 0.426 |  |
| eu-south-2 | 0.462 |  |
| eu-west-1 | 0.325 |  |
| eu-west-2 | 0.353 |  |
| eu-west-3 | 0.382 |  |
| il-central-1 | 0.576 |  |
| me-central-1 | 0.781 |  |
| me-south-1 | 0.737 |  |
| mx-central-1 | 0.252 |  |
| sa-east-1 | 0.502 |  |
| us-east-1 | 0.072 | 4378 |
| us-east-2 | 0.098 | 1459 |
| us-gov-east-1 | 0.107 | 1610 |
| us-gov-west-1 | 0.323 | 190 |
| us-west-1 | 0.258 | 3314 |
| us-west-2 | 0.314 | 152 |


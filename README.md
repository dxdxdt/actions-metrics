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
Updated: 2026-06-19T21:03:14.151600+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.056 |  |
| ap-east-1 | 0.633 |  |
| ap-east-2 | 0.575 |  |
| ap-northeast-1 | 0.457 |  |
| ap-northeast-2 | 0.559 |  |
| ap-northeast-3 | 0.483 |  |
| ap-south-1 | 0.917 |  |
| ap-south-2 | 0.895 |  |
| ap-southeast-1 | 0.709 |  |
| ap-southeast-2 | 0.593 |  |
| ap-southeast-3 | 0.766 |  |
| ap-southeast-4 | 0.631 |  |
| ap-southeast-5 | 0.730 |  |
| ap-southeast-6 | 0.625 |  |
| ap-southeast-7 | 0.819 |  |
| ca-central-1 | 0.306 | 16 |
| ca-west-1 | 0.193 |  |
| eu-central-1 | 0.577 |  |
| eu-central-2 | 0.615 |  |
| eu-north-1 | 0.622 |  |
| eu-south-1 | 0.623 |  |
| eu-south-2 | 0.610 |  |
| eu-west-1 | 0.502 |  |
| eu-west-2 | 0.537 |  |
| eu-west-3 | 0.557 |  |
| il-central-1 | 0.740 |  |
| me-central-1 | 0.964 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.700 |  |
| us-east-1 | 0.251 | 4773 |
| us-east-2 | 0.217 | 1635 |
| us-gov-east-1 | 0.227 | 1714 |
| us-gov-west-1 | 0.118 | 198 |
| us-west-1 | 0.062 | 3683 |
| us-west-2 | 0.117 | 163 |


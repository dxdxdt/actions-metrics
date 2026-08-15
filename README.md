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
Updated: 2026-08-15T16:14:56.391839+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.948 |  |
| ap-east-1 | 0.738 |  |
| ap-east-2 | 0.679 |  |
| ap-northeast-1 | 0.557 |  |
| ap-northeast-2 | 0.667 |  |
| ap-northeast-3 | 0.588 |  |
| ap-south-1 | 0.858 |  |
| ap-south-2 | 0.875 |  |
| ap-southeast-1 | 0.815 |  |
| ap-southeast-2 | 0.706 |  |
| ap-southeast-3 | 0.869 |  |
| ap-southeast-4 | 0.750 |  |
| ap-southeast-5 | 0.835 |  |
| ap-southeast-6 | 0.759 |  |
| ap-southeast-7 | 0.916 |  |
| ca-central-1 | 0.190 | 18 |
| ca-west-1 | 0.237 |  |
| eu-central-1 | 0.461 |  |
| eu-central-2 | 0.481 |  |
| eu-north-1 | 0.517 |  |
| eu-south-1 | 0.489 |  |
| eu-south-2 | 0.493 |  |
| eu-west-1 | 0.377 |  |
| eu-west-2 | 0.413 |  |
| eu-west-3 | 0.441 |  |
| il-central-1 | 0.610 |  |
| me-central-1 | 0.852 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.231 |  |
| sa-east-1 | 0.569 |  |
| us-east-1 | 0.130 | 5001 |
| us-east-2 | 0.148 | 1679 |
| us-gov-east-1 | 0.155 | 1830 |
| us-gov-west-1 | 0.233 | 222 |
| us-west-1 | 0.186 | 3958 |
| us-west-2 | 0.234 | 178 |


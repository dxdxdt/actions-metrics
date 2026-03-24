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
Updated: 2026-03-24T19:03:17.154929+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.974 |  |
| ap-east-1 | 0.728 |  |
| ap-east-2 | 0.663 |  |
| ap-northeast-1 | 0.546 |  |
| ap-northeast-2 | 0.655 |  |
| ap-northeast-3 | 0.572 |  |
| ap-south-1 | 0.904 |  |
| ap-south-2 | 0.933 |  |
| ap-southeast-1 | 0.801 |  |
| ap-southeast-2 | 0.730 |  |
| ap-southeast-3 | 0.855 |  |
| ap-southeast-4 | 0.766 |  |
| ap-southeast-5 | 0.823 |  |
| ap-southeast-6 | 0.760 |  |
| ap-southeast-7 | 0.911 |  |
| ca-central-1 | 0.163 | 16 |
| ca-west-1 | 0.221 |  |
| eu-central-1 | 0.497 |  |
| eu-central-2 | 0.518 |  |
| eu-north-1 | 0.538 |  |
| eu-south-1 | 0.513 |  |
| eu-south-2 | 0.526 |  |
| eu-west-1 | 0.425 |  |
| eu-west-2 | 0.459 |  |
| eu-west-3 | 0.465 |  |
| il-central-1 | 0.666 |  |
| me-central-1 | 0.863 |  |
| me-south-1 | 0.812 |  |
| mx-central-1 | 0.202 |  |
| sa-east-1 | 0.582 |  |
| us-east-1 | 0.148 | 4352 |
| us-east-2 | 0.125 | 1449 |
| us-gov-east-1 | 0.124 | 1601 |
| us-gov-west-1 | 0.233 | 190 |
| us-west-1 | 0.183 | 3291 |
| us-west-2 | 0.235 | 151 |


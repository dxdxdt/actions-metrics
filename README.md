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
Updated: 2026-06-06T11:19:09.979342+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.862 |  |
| ap-east-1 | 0.825 |  |
| ap-east-2 | 0.757 |  |
| ap-northeast-1 | 0.639 |  |
| ap-northeast-2 | 0.746 |  |
| ap-northeast-3 | 0.665 |  |
| ap-south-1 | 0.821 |  |
| ap-south-2 | 0.875 |  |
| ap-southeast-1 | 0.893 |  |
| ap-southeast-2 | 0.798 |  |
| ap-southeast-3 | 0.942 |  |
| ap-southeast-4 | 0.855 |  |
| ap-southeast-5 | 0.921 |  |
| ap-southeast-6 | 0.849 |  |
| ap-southeast-7 | 0.990 |  |
| ca-central-1 | 0.095 | 16 |
| ca-west-1 | 0.276 |  |
| eu-central-1 | 0.374 |  |
| eu-central-2 | 0.390 |  |
| eu-north-1 | 0.410 |  |
| eu-south-1 | 0.401 |  |
| eu-south-2 | 0.403 |  |
| eu-west-1 | 0.285 |  |
| eu-west-2 | 0.323 |  |
| eu-west-3 | 0.349 |  |
| il-central-1 | 0.522 |  |
| me-central-1 | 0.790 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.246 |  |
| sa-east-1 | 0.473 |  |
| us-east-1 | 0.042 | 4729 |
| us-east-2 | 0.088 | 1625 |
| us-gov-east-1 | 0.089 | 1709 |
| us-gov-west-1 | 0.340 | 196 |
| us-west-1 | 0.281 | 3636 |
| us-west-2 | 0.340 | 162 |


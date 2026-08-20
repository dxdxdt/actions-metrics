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
Updated: 2026-08-20T16:24:36.136156+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.941 |  |
| ap-east-1 | 0.737 |  |
| ap-east-2 | 0.675 |  |
| ap-northeast-1 | 0.558 |  |
| ap-northeast-2 | 0.659 |  |
| ap-northeast-3 | 0.583 |  |
| ap-south-1 | 0.885 |  |
| ap-south-2 | 0.959 |  |
| ap-southeast-1 | 0.811 |  |
| ap-southeast-2 | 0.717 |  |
| ap-southeast-3 | 0.871 |  |
| ap-southeast-4 | 0.756 |  |
| ap-southeast-5 | 0.828 |  |
| ap-southeast-6 | 0.742 |  |
| ap-southeast-7 | 0.913 |  |
| ca-central-1 | 0.159 | 18 |
| ca-west-1 | 0.248 |  |
| eu-central-1 | 0.446 |  |
| eu-central-2 | 0.483 |  |
| eu-north-1 | 0.512 |  |
| eu-south-1 | 0.497 |  |
| eu-south-2 | 0.491 |  |
| eu-west-1 | 0.376 |  |
| eu-west-2 | 0.420 |  |
| eu-west-3 | 0.430 |  |
| il-central-1 | 0.621 |  |
| me-central-1 | 0.829 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.199 |  |
| sa-east-1 | 0.573 |  |
| us-east-1 | 0.125 | 5028 |
| us-east-2 | 0.124 | 1680 |
| us-gov-east-1 | 0.112 | 1863 |
| us-gov-west-1 | 0.237 | 224 |
| us-west-1 | 0.180 | 4003 |
| us-west-2 | 0.232 | 184 |


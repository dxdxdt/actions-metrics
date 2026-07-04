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
Updated: 2026-07-04T09:15:28.682333+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.954 |  |
| ap-east-1 | 0.730 |  |
| ap-east-2 | 0.667 |  |
| ap-northeast-1 | 0.555 |  |
| ap-northeast-2 | 0.657 |  |
| ap-northeast-3 | 0.580 |  |
| ap-south-1 | 0.893 |  |
| ap-south-2 | 0.901 |  |
| ap-southeast-1 | 0.807 |  |
| ap-southeast-2 | 0.697 |  |
| ap-southeast-3 | 0.862 |  |
| ap-southeast-4 | 0.744 |  |
| ap-southeast-5 | 0.825 |  |
| ap-southeast-6 | 0.728 |  |
| ap-southeast-7 | 0.907 |  |
| ca-central-1 | 0.190 | 16 |
| ca-west-1 | 0.276 |  |
| eu-central-1 | 0.466 |  |
| eu-central-2 | 0.484 |  |
| eu-north-1 | 0.519 |  |
| eu-south-1 | 0.492 |  |
| eu-south-2 | 0.501 |  |
| eu-west-1 | 0.380 |  |
| eu-west-2 | 0.419 |  |
| eu-west-3 | 0.448 |  |
| il-central-1 | 0.628 |  |
| me-central-1 | 0.893 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.209 |  |
| sa-east-1 | 0.588 |  |
| us-east-1 | 0.147 | 4817 |
| us-east-2 | 0.124 | 1652 |
| us-gov-east-1 | 0.134 | 1728 |
| us-gov-west-1 | 0.219 | 200 |
| us-west-1 | 0.160 | 3737 |
| us-west-2 | 0.219 | 164 |


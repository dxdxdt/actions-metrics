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
Updated: 2026-03-15T15:22:26.955492+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.931 |  |
| ap-east-1 | 0.745 |  |
| ap-east-2 | 0.693 |  |
| ap-northeast-1 | 0.571 |  |
| ap-northeast-2 | 0.680 |  |
| ap-northeast-3 | 0.600 |  |
| ap-south-1 | 0.881 |  |
| ap-south-2 | 0.910 |  |
| ap-southeast-1 | 0.823 |  |
| ap-southeast-2 | 0.735 |  |
| ap-southeast-3 | 0.882 |  |
| ap-southeast-4 | 0.782 |  |
| ap-southeast-5 | 0.844 |  |
| ap-southeast-6 | 0.798 |  |
| ap-southeast-7 | 0.928 |  |
| ca-central-1 | 0.158 | 16 |
| ca-west-1 | 0.285 |  |
| eu-central-1 | 0.439 |  |
| eu-central-2 | 0.460 |  |
| eu-north-1 | 0.489 |  |
| eu-south-1 | 0.465 |  |
| eu-south-2 | 0.480 |  |
| eu-west-1 | 0.360 |  |
| eu-west-2 | 0.393 |  |
| eu-west-3 | 0.418 |  |
| il-central-1 | 0.619 |  |
| me-central-1 | 0.835 |  |
| me-south-1 | 0.774 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.544 |  |
| us-east-1 | 0.106 | 4284 |
| us-east-2 | 0.137 | 1424 |
| us-gov-east-1 | 0.129 | 1577 |
| us-gov-west-1 | 0.243 | 185 |
| us-west-1 | 0.208 | 3236 |
| us-west-2 | 0.244 | 148 |


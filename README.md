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
Updated: 2026-03-29T22:23:08.037728+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.916 |  |
| ap-east-1 | 0.778 |  |
| ap-east-2 | 0.712 |  |
| ap-northeast-1 | 0.595 |  |
| ap-northeast-2 | 0.699 |  |
| ap-northeast-3 | 0.618 |  |
| ap-south-1 | 0.861 |  |
| ap-south-2 | 0.922 |  |
| ap-southeast-1 | 0.853 |  |
| ap-southeast-2 | 0.769 |  |
| ap-southeast-3 | 0.903 |  |
| ap-southeast-4 | 0.809 |  |
| ap-southeast-5 | 0.871 |  |
| ap-southeast-6 | 0.793 |  |
| ap-southeast-7 | 0.959 |  |
| ca-central-1 | 0.101 | 16 |
| ca-west-1 | 0.295 |  |
| eu-central-1 | 0.420 |  |
| eu-central-2 | 0.443 |  |
| eu-north-1 | 0.478 |  |
| eu-south-1 | 0.450 |  |
| eu-south-2 | 0.486 |  |
| eu-west-1 | 0.353 |  |
| eu-west-2 | 0.381 |  |
| eu-west-3 | 0.401 |  |
| il-central-1 | 0.599 |  |
| me-central-1 | 0.802 |  |
| me-south-1 | 0.776 |  |
| mx-central-1 | 0.231 |  |
| sa-east-1 | 0.526 |  |
| us-east-1 | 0.073 | 4395 |
| us-east-2 | 0.085 | 1466 |
| us-gov-east-1 | 0.073 | 1614 |
| us-gov-west-1 | 0.282 | 190 |
| us-west-1 | 0.226 | 3317 |
| us-west-2 | 0.278 | 152 |


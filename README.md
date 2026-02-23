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
Updated: 2026-02-23T10:42:47.411832+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.019 |  |
| ap-east-1 | 0.685 |  |
| ap-east-2 | 0.625 |  |
| ap-northeast-1 | 0.506 |  |
| ap-northeast-2 | 0.611 |  |
| ap-northeast-3 | 0.529 |  |
| ap-south-1 | 0.879 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.756 |  |
| ap-southeast-2 | 0.651 |  |
| ap-southeast-3 | 0.812 |  |
| ap-southeast-4 | 0.693 |  |
| ap-southeast-5 | 0.774 |  |
| ap-southeast-6 | 0.739 |  |
| ap-southeast-7 | 0.857 |  |
| ca-central-1 | 0.230 | 16 |
| ca-west-1 | 0.190 |  |
| eu-central-1 | 0.522 |  |
| eu-central-2 | 0.544 |  |
| eu-north-1 | 0.570 |  |
| eu-south-1 | 0.556 |  |
| eu-south-2 | 0.573 |  |
| eu-west-1 | 0.454 |  |
| eu-west-2 | 0.491 |  |
| eu-west-3 | 0.509 |  |
| il-central-1 | 0.714 |  |
| me-central-1 | 0.929 |  |
| me-south-1 | 0.879 |  |
| mx-central-1 | 0.242 |  |
| sa-east-1 | 0.643 |  |
| us-east-1 | 0.186 | 4170 |
| us-east-2 | 0.172 | 1371 |
| us-gov-east-1 | 0.172 | 1502 |
| us-gov-west-1 | 0.170 | 160 |
| us-west-1 | 0.130 | 3102 |
| us-west-2 | 0.182 | 130 |


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
Updated: 2026-09-11T21:29:04.355356+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.016 |  |
| ap-east-1 | 0.667 |  |
| ap-east-2 | 0.605 |  |
| ap-northeast-1 | 0.489 |  |
| ap-northeast-2 | 0.591 |  |
| ap-northeast-3 | 0.516 |  |
| ap-south-1 | 0.942 |  |
| ap-south-2 | 0.984 |  |
| ap-southeast-1 | 0.766 |  |
| ap-southeast-2 | 0.645 |  |
| ap-southeast-3 | 0.800 |  |
| ap-southeast-4 | 0.690 |  |
| ap-southeast-5 | 0.762 |  |
| ap-southeast-6 | 0.677 |  |
| ap-southeast-7 | 0.845 |  |
| ca-central-1 | 0.242 | 18 |
| ca-west-1 | 0.251 |  |
| eu-central-1 | 0.532 |  |
| eu-central-2 | 0.553 |  |
| eu-north-1 | 0.570 |  |
| eu-south-1 | 0.544 |  |
| eu-south-2 | 0.565 |  |
| eu-west-1 | 0.457 |  |
| eu-west-2 | 0.482 |  |
| eu-west-3 | 0.506 |  |
| il-central-1 | 0.686 |  |
| me-central-1 | 0.925 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.209 |  |
| sa-east-1 | 0.633 |  |
| us-east-1 | 0.189 | 5094 |
| us-east-2 | 0.199 | 1685 |
| us-gov-east-1 | 0.182 | 1909 |
| us-gov-west-1 | 0.168 | 233 |
| us-west-1 | 0.107 | 4101 |
| us-west-2 | 0.168 | 192 |


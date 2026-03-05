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
Updated: 2026-03-05T14:41:56.132446+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.964 |  |
| ap-east-1 | 0.723 |  |
| ap-east-2 | 0.664 |  |
| ap-northeast-1 | 0.543 |  |
| ap-northeast-2 | 0.651 |  |
| ap-northeast-3 | 0.572 |  |
| ap-south-1 | 0.926 |  |
| ap-south-2 | 0.966 |  |
| ap-southeast-1 | 0.797 |  |
| ap-southeast-2 | 0.708 |  |
| ap-southeast-3 | 0.852 |  |
| ap-southeast-4 | 0.756 |  |
| ap-southeast-5 | 0.817 |  |
| ap-southeast-6 | 0.796 |  |
| ap-southeast-7 | 0.892 |  |
| ca-central-1 | 0.170 | 16 |
| ca-west-1 | 0.249 |  |
| eu-central-1 | 0.481 |  |
| eu-central-2 | 0.489 |  |
| eu-north-1 | 0.524 |  |
| eu-south-1 | 0.519 |  |
| eu-south-2 | 0.516 |  |
| eu-west-1 | 0.390 |  |
| eu-west-2 | 0.436 |  |
| eu-west-3 | 0.460 |  |
| il-central-1 | 0.641 |  |
| me-central-1 | 0.857 |  |
| me-south-1 | 0.810 |  |
| mx-central-1 | 0.206 |  |
| sa-east-1 | 0.601 |  |
| us-east-1 | 0.130 | 4225 |
| us-east-2 | 0.139 | 1400 |
| us-gov-east-1 | 0.122 | 1532 |
| us-gov-west-1 | 0.201 | 171 |
| us-west-1 | 0.222 | 3176 |
| us-west-2 | 0.205 | 141 |


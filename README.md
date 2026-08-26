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
Updated: 2026-08-26T16:11:56.493875+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.977 |  |
| ap-east-1 | 0.691 |  |
| ap-east-2 | 0.633 |  |
| ap-northeast-1 | 0.514 |  |
| ap-northeast-2 | 0.620 |  |
| ap-northeast-3 | 0.541 |  |
| ap-south-1 | 0.888 |  |
| ap-south-2 | 0.952 |  |
| ap-southeast-1 | 0.770 |  |
| ap-southeast-2 | 0.685 |  |
| ap-southeast-3 | 0.826 |  |
| ap-southeast-4 | 0.732 |  |
| ap-southeast-5 | 0.789 |  |
| ap-southeast-6 | 0.708 |  |
| ap-southeast-7 | 0.871 |  |
| ca-central-1 | 0.189 | 18 |
| ca-west-1 | 0.204 |  |
| eu-central-1 | 0.501 |  |
| eu-central-2 | 0.524 |  |
| eu-north-1 | 0.545 |  |
| eu-south-1 | 0.523 |  |
| eu-south-2 | 0.548 |  |
| eu-west-1 | 0.432 |  |
| eu-west-2 | 0.454 |  |
| eu-west-3 | 0.489 |  |
| il-central-1 | 0.667 |  |
| me-central-1 | 0.860 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.207 |  |
| sa-east-1 | 0.611 |  |
| us-east-1 | 0.152 | 5071 |
| us-east-2 | 0.160 | 1684 |
| us-gov-east-1 | 0.140 | 1887 |
| us-gov-west-1 | 0.188 | 228 |
| us-west-1 | 0.158 | 4060 |
| us-west-2 | 0.185 | 189 |


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
Updated: 2026-09-02T10:17:32.579243+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.008 |  |
| ap-east-1 | 0.676 |  |
| ap-east-2 | 0.615 |  |
| ap-northeast-1 | 0.498 |  |
| ap-northeast-2 | 0.605 |  |
| ap-northeast-3 | 0.525 |  |
| ap-south-1 | 0.891 |  |
| ap-south-2 | 0.944 |  |
| ap-southeast-1 | 0.763 |  |
| ap-southeast-2 | 0.668 |  |
| ap-southeast-3 | 0.811 |  |
| ap-southeast-4 | 0.709 |  |
| ap-southeast-5 | 0.773 |  |
| ap-southeast-6 | 0.689 |  |
| ap-southeast-7 | 0.853 |  |
| ca-central-1 | 0.221 | 18 |
| ca-west-1 | 0.219 |  |
| eu-central-1 | 0.513 |  |
| eu-central-2 | 0.528 |  |
| eu-north-1 | 0.576 |  |
| eu-south-1 | 0.538 |  |
| eu-south-2 | 0.549 |  |
| eu-west-1 | 0.441 |  |
| eu-west-2 | 0.480 |  |
| eu-west-3 | 0.493 |  |
| il-central-1 | 0.668 |  |
| me-central-1 | 0.879 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.209 |  |
| sa-east-1 | 0.644 |  |
| us-east-1 | 0.181 | 5078 |
| us-east-2 | 0.175 | 1685 |
| us-gov-east-1 | 0.154 | 1892 |
| us-gov-west-1 | 0.168 | 230 |
| us-west-1 | 0.139 | 4075 |
| us-west-2 | 0.165 | 190 |


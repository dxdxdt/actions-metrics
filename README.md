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
Updated: 2026-06-26T06:46:34.546420+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.039 |  |
| ap-east-1 | 0.645 |  |
| ap-east-2 | 0.588 |  |
| ap-northeast-1 | 0.468 |  |
| ap-northeast-2 | 0.578 |  |
| ap-northeast-3 | 0.492 |  |
| ap-south-1 | 0.925 |  |
| ap-south-2 | 0.899 |  |
| ap-southeast-1 | 0.721 |  |
| ap-southeast-2 | 0.613 |  |
| ap-southeast-3 | 0.775 |  |
| ap-southeast-4 | 0.654 |  |
| ap-southeast-5 | 0.740 |  |
| ap-southeast-6 | 0.641 |  |
| ap-southeast-7 | 0.822 |  |
| ca-central-1 | 0.275 | 16 |
| ca-west-1 | 0.220 |  |
| eu-central-1 | 0.565 |  |
| eu-central-2 | 0.594 |  |
| eu-north-1 | 0.613 |  |
| eu-south-1 | 0.602 |  |
| eu-south-2 | 0.601 |  |
| eu-west-1 | 0.489 |  |
| eu-west-2 | 0.526 |  |
| eu-west-3 | 0.544 |  |
| il-central-1 | 0.722 |  |
| me-central-1 | 0.954 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.226 |  |
| sa-east-1 | 0.670 |  |
| us-east-1 | 0.229 | 4788 |
| us-east-2 | 0.221 | 1640 |
| us-gov-east-1 | 0.205 | 1720 |
| us-gov-west-1 | 0.133 | 199 |
| us-west-1 | 0.075 | 3709 |
| us-west-2 | 0.134 | 163 |


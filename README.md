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
Updated: 2026-09-05T09:44:18.205872+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.992 |  |
| ap-east-1 | 0.691 |  |
| ap-east-2 | 0.627 |  |
| ap-northeast-1 | 0.512 |  |
| ap-northeast-2 | 0.613 |  |
| ap-northeast-3 | 0.539 |  |
| ap-south-1 | 0.922 |  |
| ap-south-2 | 0.990 |  |
| ap-southeast-1 | 0.786 |  |
| ap-southeast-2 | 0.675 |  |
| ap-southeast-3 | 0.823 |  |
| ap-southeast-4 | 0.714 |  |
| ap-southeast-5 | 0.785 |  |
| ap-southeast-6 | 0.703 |  |
| ap-southeast-7 | 0.875 |  |
| ca-central-1 | 0.220 | 18 |
| ca-west-1 | 0.239 |  |
| eu-central-1 | 0.487 |  |
| eu-central-2 | 0.528 |  |
| eu-north-1 | 0.545 |  |
| eu-south-1 | 0.523 |  |
| eu-south-2 | 0.545 |  |
| eu-west-1 | 0.421 |  |
| eu-west-2 | 0.454 |  |
| eu-west-3 | 0.485 |  |
| il-central-1 | 0.653 |  |
| me-central-1 | 0.863 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.177 |  |
| sa-east-1 | 0.613 |  |
| us-east-1 | 0.170 | 5084 |
| us-east-2 | 0.162 | 1685 |
| us-gov-east-1 | 0.137 | 1896 |
| us-gov-west-1 | 0.188 | 231 |
| us-west-1 | 0.133 | 4082 |
| us-west-2 | 0.186 | 192 |


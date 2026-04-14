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
Updated: 2026-04-14T22:39:11.214916+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.899 |  |
| ap-east-1 | 0.784 |  |
| ap-east-2 | 0.722 |  |
| ap-northeast-1 | 0.603 |  |
| ap-northeast-2 | 0.723 |  |
| ap-northeast-3 | 0.643 |  |
| ap-south-1 | 0.855 |  |
| ap-south-2 | 0.914 |  |
| ap-southeast-1 | 0.861 |  |
| ap-southeast-2 | 0.774 |  |
| ap-southeast-3 | 0.925 |  |
| ap-southeast-4 | 0.845 |  |
| ap-southeast-5 | 0.881 |  |
| ap-southeast-6 | 0.876 |  |
| ap-southeast-7 | 0.964 |  |
| ca-central-1 | 0.141 | 16 |
| ca-west-1 | 0.292 |  |
| eu-central-1 | 0.404 |  |
| eu-central-2 | 0.426 |  |
| eu-north-1 | 0.464 |  |
| eu-south-1 | 0.432 |  |
| eu-south-2 | 0.435 |  |
| eu-west-1 | 0.327 |  |
| eu-west-2 | 0.366 |  |
| eu-west-3 | 0.385 |  |
| il-central-1 | 0.577 |  |
| me-central-1 | 0.812 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.241 |  |
| sa-east-1 | 0.508 |  |
| us-east-1 | 0.075 | 4505 |
| us-east-2 | 0.108 | 1500 |
| us-gov-east-1 | 0.108 | 1647 |
| us-gov-west-1 | 0.304 | 193 |
| us-west-1 | 0.245 | 3412 |
| us-west-2 | 0.298 | 155 |


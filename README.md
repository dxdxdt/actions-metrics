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
Updated: 2026-06-23T21:26:10.280931+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.002 |  |
| ap-east-1 | 0.683 |  |
| ap-east-2 | 0.623 |  |
| ap-northeast-1 | 0.504 |  |
| ap-northeast-2 | 0.608 |  |
| ap-northeast-3 | 0.529 |  |
| ap-south-1 | 0.905 |  |
| ap-south-2 | 0.899 |  |
| ap-southeast-1 | 0.760 |  |
| ap-southeast-2 | 0.664 |  |
| ap-southeast-3 | 0.822 |  |
| ap-southeast-4 | 0.708 |  |
| ap-southeast-5 | 0.780 |  |
| ap-southeast-6 | 0.696 |  |
| ap-southeast-7 | 0.864 |  |
| ca-central-1 | 0.226 | 16 |
| ca-west-1 | 0.220 |  |
| eu-central-1 | 0.523 |  |
| eu-central-2 | 0.549 |  |
| eu-north-1 | 0.557 |  |
| eu-south-1 | 0.542 |  |
| eu-south-2 | 0.544 |  |
| eu-west-1 | 0.435 |  |
| eu-west-2 | 0.477 |  |
| eu-west-3 | 0.498 |  |
| il-central-1 | 0.667 |  |
| me-central-1 | 0.901 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.248 |  |
| sa-east-1 | 0.625 |  |
| us-east-1 | 0.171 | 4785 |
| us-east-2 | 0.167 | 1638 |
| us-gov-east-1 | 0.159 | 1719 |
| us-gov-west-1 | 0.187 | 199 |
| us-west-1 | 0.133 | 3695 |
| us-west-2 | 0.186 | 163 |


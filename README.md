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
Updated: 2026-09-22T19:26:41.443315+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.966 |  |
| ap-east-1 | 0.723 |  |
| ap-east-2 | 0.657 |  |
| ap-northeast-1 | 0.539 |  |
| ap-northeast-2 | 0.640 |  |
| ap-northeast-3 | 0.565 |  |
| ap-south-1 | 0.921 |  |
| ap-south-2 | 0.956 |  |
| ap-southeast-1 | 0.847 |  |
| ap-southeast-2 | 0.700 |  |
| ap-southeast-3 | 0.881 |  |
| ap-southeast-4 | 0.744 |  |
| ap-southeast-5 | 0.851 |  |
| ap-southeast-6 | 0.754 |  |
| ap-southeast-7 | 0.925 |  |
| ca-central-1 | 0.175 | 18 |
| ca-west-1 | 0.263 |  |
| eu-central-1 | 0.478 |  |
| eu-central-2 | 0.496 |  |
| eu-north-1 | 0.536 |  |
| eu-south-1 | 0.492 |  |
| eu-south-2 | 0.507 |  |
| eu-west-1 | 0.402 |  |
| eu-west-2 | 0.435 |  |
| eu-west-3 | 0.465 |  |
| il-central-1 | 0.642 |  |
| me-central-1 | 0.868 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.217 |  |
| sa-east-1 | 0.588 |  |
| us-east-1 | 0.132 | 5113 |
| us-east-2 | 0.160 | 1686 |
| us-gov-east-1 | 0.156 | 1924 |
| us-gov-west-1 | 0.218 | 235 |
| us-west-1 | 0.166 | 4133 |
| us-west-2 | 0.220 | 192 |


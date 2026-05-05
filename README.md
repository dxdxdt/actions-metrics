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
Updated: 2026-05-05T23:41:54.836873+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.904 |  |
| ap-east-1 | 0.764 |  |
| ap-east-2 | 0.709 |  |
| ap-northeast-1 | 0.588 |  |
| ap-northeast-2 | 0.694 |  |
| ap-northeast-3 | 0.617 |  |
| ap-south-1 | 0.889 |  |
| ap-south-2 | 0.926 |  |
| ap-southeast-1 | 0.852 |  |
| ap-southeast-2 | 0.770 |  |
| ap-southeast-3 | 0.909 |  |
| ap-southeast-4 | 0.816 |  |
| ap-southeast-5 | 0.864 |  |
| ap-southeast-6 | 0.791 |  |
| ap-southeast-7 | 0.945 |  |
| ca-central-1 | 0.128 | 16 |
| ca-west-1 | 0.248 |  |
| eu-central-1 | 0.433 |  |
| eu-central-2 | 0.449 |  |
| eu-north-1 | 0.506 |  |
| eu-south-1 | 0.469 |  |
| eu-south-2 | 0.477 |  |
| eu-west-1 | 0.348 |  |
| eu-west-2 | 0.390 |  |
| eu-west-3 | 0.410 |  |
| il-central-1 | 0.597 |  |
| me-central-1 | 0.804 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.204 |  |
| sa-east-1 | 0.535 |  |
| us-east-1 | 0.111 | 4603 |
| us-east-2 | 0.098 | 1567 |
| us-gov-east-1 | 0.093 | 1674 |
| us-gov-west-1 | 0.280 | 194 |
| us-west-1 | 0.230 | 3535 |
| us-west-2 | 0.277 | 157 |


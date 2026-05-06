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
Updated: 2026-05-06T02:04:58.259782+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.921 |  |
| ap-east-1 | 0.769 |  |
| ap-east-2 | 0.712 |  |
| ap-northeast-1 | 0.588 |  |
| ap-northeast-2 | 0.698 |  |
| ap-northeast-3 | 0.619 |  |
| ap-south-1 | 0.877 |  |
| ap-south-2 | 0.926 |  |
| ap-southeast-1 | 0.853 |  |
| ap-southeast-2 | 0.757 |  |
| ap-southeast-3 | 0.896 |  |
| ap-southeast-4 | 0.819 |  |
| ap-southeast-5 | 0.867 |  |
| ap-southeast-6 | 0.818 |  |
| ap-southeast-7 | 0.938 |  |
| ca-central-1 | 0.113 | 16 |
| ca-west-1 | 0.239 |  |
| eu-central-1 | 0.448 |  |
| eu-central-2 | 0.458 |  |
| eu-north-1 | 0.504 |  |
| eu-south-1 | 0.472 |  |
| eu-south-2 | 0.479 |  |
| eu-west-1 | 0.364 |  |
| eu-west-2 | 0.399 |  |
| eu-west-3 | 0.426 |  |
| il-central-1 | 0.596 |  |
| me-central-1 | 0.804 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.211 |  |
| sa-east-1 | 0.542 |  |
| us-east-1 | 0.101 | 4603 |
| us-east-2 | 0.084 | 1567 |
| us-gov-east-1 | 0.080 | 1675 |
| us-gov-west-1 | 0.265 | 194 |
| us-west-1 | 0.220 | 3535 |
| us-west-2 | 0.270 | 157 |


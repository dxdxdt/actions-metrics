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
Updated: 2026-05-02T19:49:43.893190+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.038 |  |
| ap-east-1 | 0.656 |  |
| ap-east-2 | 0.590 |  |
| ap-northeast-1 | 0.477 |  |
| ap-northeast-2 | 0.579 |  |
| ap-northeast-3 | 0.504 |  |
| ap-south-1 | 0.897 |  |
| ap-south-2 | 0.882 |  |
| ap-southeast-1 | 0.736 |  |
| ap-southeast-2 | 0.635 |  |
| ap-southeast-3 | 0.790 |  |
| ap-southeast-4 | 0.676 |  |
| ap-southeast-5 | 0.758 |  |
| ap-southeast-6 | 0.688 |  |
| ap-southeast-7 | 0.839 |  |
| ca-central-1 | 0.274 | 16 |
| ca-west-1 | 0.214 |  |
| eu-central-1 | 0.554 |  |
| eu-central-2 | 0.561 |  |
| eu-north-1 | 0.605 |  |
| eu-south-1 | 0.566 |  |
| eu-south-2 | 0.567 |  |
| eu-west-1 | 0.468 |  |
| eu-west-2 | 0.506 |  |
| eu-west-3 | 0.526 |  |
| il-central-1 | 0.712 |  |
| me-central-1 | 0.933 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.234 |  |
| sa-east-1 | 0.664 |  |
| us-east-1 | 0.214 | 4586 |
| us-east-2 | 0.215 | 1558 |
| us-gov-east-1 | 0.199 | 1670 |
| us-gov-west-1 | 0.159 | 194 |
| us-west-1 | 0.105 | 3520 |
| us-west-2 | 0.160 | 157 |


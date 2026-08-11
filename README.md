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
Updated: 2026-08-11T05:54:45.876200+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.958 |  |
| ap-east-1 | 0.728 |  |
| ap-east-2 | 0.669 |  |
| ap-northeast-1 | 0.550 |  |
| ap-northeast-2 | 0.653 |  |
| ap-northeast-3 | 0.579 |  |
| ap-south-1 | 0.895 |  |
| ap-south-2 | 0.956 |  |
| ap-southeast-1 | 0.802 |  |
| ap-southeast-2 | 0.709 |  |
| ap-southeast-3 | 0.861 |  |
| ap-southeast-4 | 0.748 |  |
| ap-southeast-5 | 0.824 |  |
| ap-southeast-6 | 0.746 |  |
| ap-southeast-7 | 0.909 |  |
| ca-central-1 | 0.159 | 18 |
| ca-west-1 | 0.228 |  |
| eu-central-1 | 0.469 |  |
| eu-central-2 | 0.483 |  |
| eu-north-1 | 0.502 |  |
| eu-south-1 | 0.485 |  |
| eu-south-2 | 0.497 |  |
| eu-west-1 | 0.379 |  |
| eu-west-2 | 0.441 |  |
| eu-west-3 | 0.453 |  |
| il-central-1 | 0.629 |  |
| me-central-1 | 0.828 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.201 |  |
| sa-east-1 | 0.585 |  |
| us-east-1 | 0.129 | 4974 |
| us-east-2 | 0.128 | 1678 |
| us-gov-east-1 | 0.107 | 1820 |
| us-gov-west-1 | 0.224 | 216 |
| us-west-1 | 0.164 | 3919 |
| us-west-2 | 0.221 | 176 |


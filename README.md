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
Updated: 2026-04-22T10:14:19.642176+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.962 |  |
| ap-east-1 | 0.735 |  |
| ap-east-2 | 0.666 |  |
| ap-northeast-1 | 0.560 |  |
| ap-northeast-2 | 0.663 |  |
| ap-northeast-3 | 0.581 |  |
| ap-south-1 | 0.898 |  |
| ap-south-2 | 1.008 |  |
| ap-southeast-1 | 0.805 |  |
| ap-southeast-2 | 0.722 |  |
| ap-southeast-3 | 0.861 |  |
| ap-southeast-4 | 0.760 |  |
| ap-southeast-5 | 0.828 |  |
| ap-southeast-6 | 0.790 |  |
| ap-southeast-7 | 0.909 |  |
| ca-central-1 | 0.177 | 16 |
| ca-west-1 | 0.269 |  |
| eu-central-1 | 0.465 |  |
| eu-central-2 | 0.473 |  |
| eu-north-1 | 0.524 |  |
| eu-south-1 | 0.490 |  |
| eu-south-2 | 0.509 |  |
| eu-west-1 | 0.384 |  |
| eu-west-2 | 0.412 |  |
| eu-west-3 | 0.450 |  |
| il-central-1 | 0.646 |  |
| me-central-1 | 0.859 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.215 |  |
| sa-east-1 | 0.578 |  |
| us-east-1 | 0.121 | 4540 |
| us-east-2 | 0.124 | 1523 |
| us-gov-east-1 | 0.120 | 1661 |
| us-gov-west-1 | 0.234 | 194 |
| us-west-1 | 0.171 | 3458 |
| us-west-2 | 0.232 | 157 |


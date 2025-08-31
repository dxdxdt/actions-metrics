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
Updated: 2025-08-31T17:10:28.246177+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.030 |  |
| ap-east-1 | 0.712 |  |
| ap-northeast-1 | 0.515 |  |
| ap-northeast-2 | 0.616 |  |
| ap-south-1 | 0.892 |  |
| ap-southeast-1 | 0.765 |  |
| ap-southeast-2 | 0.648 |  |
| ca-central-1 | 0.224 | 13 |
| eu-central-1 | 0.550 |  |
| eu-north-1 | 0.589 |  |
| eu-south-1 | 0.568 |  |
| eu-west-1 | 0.462 |  |
| eu-west-2 | 0.501 |  |
| eu-west-3 | 0.520 |  |
| me-south-1 | 0.894 |  |
| sa-east-1 | 0.636 |  |
| us-east-1 | 0.197 | 2940 |
| us-east-2 | 0.190 | 780 |
| us-gov-east-1 | 0.166 | 897 |
| us-gov-west-1 | 0.166 | 3 |
| us-west-1 | 0.132 | 1944 |
| us-west-2 | 0.169 |  |


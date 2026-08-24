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
Updated: 2026-08-24T02:19:18.578318+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.933 |  |
| ap-east-1 | 0.743 |  |
| ap-east-2 | 0.684 |  |
| ap-northeast-1 | 0.565 |  |
| ap-northeast-2 | 0.672 |  |
| ap-northeast-3 | 0.591 |  |
| ap-south-1 | 0.889 |  |
| ap-south-2 | 0.954 |  |
| ap-southeast-1 | 0.818 |  |
| ap-southeast-2 | 0.722 |  |
| ap-southeast-3 | 0.874 |  |
| ap-southeast-4 | 0.764 |  |
| ap-southeast-5 | 0.842 |  |
| ap-southeast-6 | 0.742 |  |
| ap-southeast-7 | 0.925 |  |
| ca-central-1 | 0.118 | 18 |
| ca-west-1 | 0.227 |  |
| eu-central-1 | 0.443 |  |
| eu-central-2 | 0.458 |  |
| eu-north-1 | 0.485 |  |
| eu-south-1 | 0.464 |  |
| eu-south-2 | 0.480 |  |
| eu-west-1 | 0.361 |  |
| eu-west-2 | 0.398 |  |
| eu-west-3 | 0.426 |  |
| il-central-1 | 0.603 |  |
| me-central-1 | 0.822 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.202 |  |
| sa-east-1 | 0.585 |  |
| us-east-1 | 0.115 | 5050 |
| us-east-2 | 0.107 | 1682 |
| us-gov-east-1 | 0.083 | 1876 |
| us-gov-west-1 | 0.238 | 226 |
| us-west-1 | 0.178 | 4041 |
| us-west-2 | 0.235 | 185 |


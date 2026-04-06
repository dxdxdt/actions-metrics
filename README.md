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
Updated: 2026-04-06T04:39:23.868597+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.923 |  |
| ap-east-1 | 0.756 |  |
| ap-east-2 | 0.697 |  |
| ap-northeast-1 | 0.571 |  |
| ap-northeast-2 | 0.683 |  |
| ap-northeast-3 | 0.597 |  |
| ap-south-1 | 0.879 |  |
| ap-south-2 | 0.901 |  |
| ap-southeast-1 | 0.836 |  |
| ap-southeast-2 | 0.734 |  |
| ap-southeast-3 | 0.899 |  |
| ap-southeast-4 | 0.772 |  |
| ap-southeast-5 | 0.860 |  |
| ap-southeast-6 | 0.772 |  |
| ap-southeast-7 | 0.941 |  |
| ca-central-1 | 0.158 | 16 |
| ca-west-1 | 0.262 |  |
| eu-central-1 | 0.430 |  |
| eu-central-2 | 0.456 |  |
| eu-north-1 | 0.492 |  |
| eu-south-1 | 0.465 |  |
| eu-south-2 | 0.470 |  |
| eu-west-1 | 0.360 |  |
| eu-west-2 | 0.400 |  |
| eu-west-3 | 0.412 |  |
| il-central-1 | 0.611 |  |
| me-central-1 | 0.800 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.532 |  |
| us-east-1 | 0.106 | 4446 |
| us-east-2 | 0.113 | 1485 |
| us-gov-east-1 | 0.118 | 1630 |
| us-gov-west-1 | 0.263 | 191 |
| us-west-1 | 0.215 | 3360 |
| us-west-2 | 0.262 | 153 |


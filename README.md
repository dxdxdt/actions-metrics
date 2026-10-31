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
Updated: 2026-10-31T01:17:31.004402+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.752 |  |
| ap-east-1 | 0.511 |  |
| ap-east-2 | 0.464 |  |
| ap-northeast-1 | 0.382 |  |
| ap-northeast-2 | 0.457 |  |
| ap-northeast-3 | 0.396 |  |
| ap-south-1 | 0.680 |  |
| ap-south-2 | 0.708 |  |
| ap-southeast-1 | 0.569 |  |
| ap-southeast-2 | 0.506 |  |
| ap-southeast-3 | 0.611 |  |
| ap-southeast-4 | 0.565 |  |
| ap-southeast-5 | 0.583 |  |
| ap-southeast-6 | 0.527 |  |
| ap-southeast-7 | 0.645 |  |
| ca-central-1 | 0.157 | 18 |
| ca-west-1 | 0.182 |  |
| eu-central-1 | 0.385 |  |
| eu-central-2 | 0.409 |  |
| eu-north-1 | 0.418 |  |
| eu-south-1 | 0.397 |  |
| eu-south-2 | 0.402 |  |
| eu-west-1 | 0.326 |  |
| eu-west-2 | 0.354 |  |
| eu-west-3 | 0.371 |  |
| il-central-1 | 0.500 |  |
| me-central-1 | 0.642 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.170 |  |
| sa-east-1 | 0.480 |  |
| us-east-1 | 0.132 | 5168 |
| us-east-2 | 0.129 | 1715 |
| us-gov-east-1 | 0.135 | 1956 |
| us-gov-west-1 | 0.131 | 241 |
| us-west-1 | 0.112 | 4202 |
| us-west-2 | 0.130 | 195 |


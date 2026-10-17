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
Updated: 2026-10-17T07:22:47.416383+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.980 |  |
| ap-east-1 | 0.696 |  |
| ap-east-2 | 0.637 |  |
| ap-northeast-1 | 0.517 |  |
| ap-northeast-2 | 0.623 |  |
| ap-northeast-3 | 0.541 |  |
| ap-south-1 | 0.917 |  |
| ap-south-2 | 0.973 |  |
| ap-southeast-1 | 0.772 |  |
| ap-southeast-2 | 0.674 |  |
| ap-southeast-3 | 0.830 |  |
| ap-southeast-4 | 0.716 |  |
| ap-southeast-5 | 0.792 |  |
| ap-southeast-6 | 0.779 |  |
| ap-southeast-7 | 0.877 |  |
| ca-central-1 | 0.177 | 18 |
| ca-west-1 | 0.210 |  |
| eu-central-1 | 0.493 |  |
| eu-central-2 | 0.514 |  |
| eu-north-1 | 0.546 |  |
| eu-south-1 | 0.510 |  |
| eu-south-2 | 0.501 |  |
| eu-west-1 | 0.409 |  |
| eu-west-2 | 0.455 |  |
| eu-west-3 | 0.488 |  |
| il-central-1 | 0.653 |  |
| me-central-1 | 0.879 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.213 |  |
| sa-east-1 | 0.609 |  |
| us-east-1 | 0.169 | 5148 |
| us-east-2 | 0.141 | 1701 |
| us-gov-east-1 | 0.176 | 1946 |
| us-gov-west-1 | 0.202 | 238 |
| us-west-1 | 0.136 | 4174 |
| us-west-2 | 0.201 | 194 |


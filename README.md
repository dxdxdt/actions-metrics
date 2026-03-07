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
Updated: 2026-03-07T01:16:17.525749+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.984 |  |
| ap-east-1 | 0.716 |  |
| ap-east-2 | 0.658 |  |
| ap-northeast-1 | 0.541 |  |
| ap-northeast-2 | 0.633 |  |
| ap-northeast-3 | 0.566 |  |
| ap-south-1 | 0.923 |  |
| ap-south-2 | 0.964 |  |
| ap-southeast-1 | 0.792 |  |
| ap-southeast-2 | 0.700 |  |
| ap-southeast-3 | 0.845 |  |
| ap-southeast-4 | 0.742 |  |
| ap-southeast-5 | 0.811 |  |
| ap-southeast-6 | 0.764 |  |
| ap-southeast-7 | 0.890 |  |
| ca-central-1 | 0.151 | 16 |
| ca-west-1 | 0.222 |  |
| eu-central-1 | 0.486 |  |
| eu-central-2 | 0.502 |  |
| eu-north-1 | 0.534 |  |
| eu-south-1 | 0.513 |  |
| eu-south-2 | 0.529 |  |
| eu-west-1 | 0.402 |  |
| eu-west-2 | 0.442 |  |
| eu-west-3 | 0.467 |  |
| il-central-1 | 0.672 |  |
| me-central-1 | 0.857 |  |
| me-south-1 | 0.818 |  |
| mx-central-1 | 0.223 |  |
| sa-east-1 | 0.595 |  |
| us-east-1 | 0.137 | 4232 |
| us-east-2 | 0.132 | 1405 |
| us-gov-east-1 | 0.105 | 1534 |
| us-gov-west-1 | 0.193 | 174 |
| us-west-1 | 0.200 | 3187 |
| us-west-2 | 0.193 | 142 |


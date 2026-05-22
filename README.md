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
Updated: 2026-05-22T02:37:48.994279+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.016 |  |
| ap-east-1 | 0.697 |  |
| ap-east-2 | 0.639 |  |
| ap-northeast-1 | 0.528 |  |
| ap-northeast-2 | 0.625 |  |
| ap-northeast-3 | 0.549 |  |
| ap-south-1 | 0.929 |  |
| ap-south-2 | 0.944 |  |
| ap-southeast-1 | 0.772 |  |
| ap-southeast-2 | 0.674 |  |
| ap-southeast-3 | 0.828 |  |
| ap-southeast-4 | 0.716 |  |
| ap-southeast-5 | 0.795 |  |
| ap-southeast-6 | 0.713 |  |
| ap-southeast-7 | 0.877 |  |
| ca-central-1 | 0.193 | 16 |
| ca-west-1 | 0.288 |  |
| eu-central-1 | 0.527 |  |
| eu-central-2 | 0.537 |  |
| eu-north-1 | 0.572 |  |
| eu-south-1 | 0.553 |  |
| eu-south-2 | 0.554 |  |
| eu-west-1 | 0.445 |  |
| eu-west-2 | 0.482 |  |
| eu-west-3 | 0.503 |  |
| il-central-1 | 0.684 |  |
| me-central-1 | 0.935 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.223 |  |
| sa-east-1 | 0.617 |  |
| us-east-1 | 0.177 | 4672 |
| us-east-2 | 0.124 | 1605 |
| us-gov-east-1 | 0.130 | 1700 |
| us-gov-west-1 | 0.192 | 195 |
| us-west-1 | 0.141 | 3587 |
| us-west-2 | 0.190 | 158 |


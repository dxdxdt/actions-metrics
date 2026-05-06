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
Updated: 2026-05-06T21:04:37.982336+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.949 |  |
| ap-east-1 | 0.751 |  |
| ap-east-2 | 0.682 |  |
| ap-northeast-1 | 0.576 |  |
| ap-northeast-2 | 0.669 |  |
| ap-northeast-3 | 0.603 |  |
| ap-south-1 | 0.907 |  |
| ap-south-2 | 0.942 |  |
| ap-southeast-1 | 0.826 |  |
| ap-southeast-2 | 0.734 |  |
| ap-southeast-3 | 0.877 |  |
| ap-southeast-4 | 0.793 |  |
| ap-southeast-5 | 0.848 |  |
| ap-southeast-6 | 0.826 |  |
| ap-southeast-7 | 0.926 |  |
| ca-central-1 | 0.158 | 16 |
| ca-west-1 | 0.231 |  |
| eu-central-1 | 0.471 |  |
| eu-central-2 | 0.475 |  |
| eu-north-1 | 0.532 |  |
| eu-south-1 | 0.478 |  |
| eu-south-2 | 0.500 |  |
| eu-west-1 | 0.391 |  |
| eu-west-2 | 0.420 |  |
| eu-west-3 | 0.438 |  |
| il-central-1 | 0.609 |  |
| me-central-1 | 0.831 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.196 |  |
| sa-east-1 | 0.567 |  |
| us-east-1 | 0.108 | 4604 |
| us-east-2 | 0.089 | 1570 |
| us-gov-east-1 | 0.088 | 1677 |
| us-gov-west-1 | 0.243 | 194 |
| us-west-1 | 0.189 | 3536 |
| us-west-2 | 0.241 | 157 |


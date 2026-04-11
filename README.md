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
Updated: 2026-04-11T09:33:34.604884+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.966 |  |
| ap-east-1 | 0.722 |  |
| ap-east-2 | 0.664 |  |
| ap-northeast-1 | 0.547 |  |
| ap-northeast-2 | 0.651 |  |
| ap-northeast-3 | 0.573 |  |
| ap-south-1 | 0.858 |  |
| ap-south-2 | 0.901 |  |
| ap-southeast-1 | 0.805 |  |
| ap-southeast-2 | 0.696 |  |
| ap-southeast-3 | 0.858 |  |
| ap-southeast-4 | 0.737 |  |
| ap-southeast-5 | 0.821 |  |
| ap-southeast-6 | 0.786 |  |
| ap-southeast-7 | 0.907 |  |
| ca-central-1 | 0.197 | 16 |
| ca-west-1 | 0.265 |  |
| eu-central-1 | 0.485 |  |
| eu-central-2 | 0.493 |  |
| eu-north-1 | 0.529 |  |
| eu-south-1 | 0.508 |  |
| eu-south-2 | 0.518 |  |
| eu-west-1 | 0.398 |  |
| eu-west-2 | 0.439 |  |
| eu-west-3 | 0.452 |  |
| il-central-1 | 0.647 |  |
| me-central-1 | 0.845 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.585 |  |
| us-east-1 | 0.146 | 4476 |
| us-east-2 | 0.147 | 1492 |
| us-gov-east-1 | 0.158 | 1640 |
| us-gov-west-1 | 0.213 | 192 |
| us-west-1 | 0.163 | 3395 |
| us-west-2 | 0.214 | 155 |


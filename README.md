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
Updated: 2026-05-05T02:05:23.988023+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.880 |  |
| ap-east-1 | 0.797 |  |
| ap-east-2 | 0.753 |  |
| ap-northeast-1 | 0.617 |  |
| ap-northeast-2 | 0.738 |  |
| ap-northeast-3 | 0.641 |  |
| ap-south-1 | 0.823 |  |
| ap-south-2 | 0.875 |  |
| ap-southeast-1 | 0.883 |  |
| ap-southeast-2 | 0.810 |  |
| ap-southeast-3 | 0.950 |  |
| ap-southeast-4 | 0.851 |  |
| ap-southeast-5 | 0.905 |  |
| ap-southeast-6 | 0.871 |  |
| ap-southeast-7 | 0.982 |  |
| ca-central-1 | 0.118 | 16 |
| ca-west-1 | 0.293 |  |
| eu-central-1 | 0.390 |  |
| eu-central-2 | 0.420 |  |
| eu-north-1 | 0.440 |  |
| eu-south-1 | 0.432 |  |
| eu-south-2 | 0.416 |  |
| eu-west-1 | 0.307 |  |
| eu-west-2 | 0.344 |  |
| eu-west-3 | 0.359 |  |
| il-central-1 | 0.550 |  |
| me-central-1 | 0.783 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.483 |  |
| us-east-1 | 0.059 | 4596 |
| us-east-2 | 0.090 | 1566 |
| us-gov-east-1 | 0.100 | 1673 |
| us-gov-west-1 | 0.337 | 194 |
| us-west-1 | 0.271 | 3532 |
| us-west-2 | 0.337 | 157 |


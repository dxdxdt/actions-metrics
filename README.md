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
Updated: 2026-03-19T01:26:49.612737+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.908 |  |
| ap-east-1 | 0.786 |  |
| ap-east-2 | 0.718 |  |
| ap-northeast-1 | 0.595 |  |
| ap-northeast-2 | 0.709 |  |
| ap-northeast-3 | 0.620 |  |
| ap-south-1 | 0.863 |  |
| ap-south-2 | 0.907 |  |
| ap-southeast-1 | 0.856 |  |
| ap-southeast-2 | 0.756 |  |
| ap-southeast-3 | 0.917 |  |
| ap-southeast-4 | 0.797 |  |
| ap-southeast-5 | 0.879 |  |
| ap-southeast-6 | 0.823 |  |
| ap-southeast-7 | 0.965 |  |
| ca-central-1 | 0.127 | 16 |
| ca-west-1 | 0.263 |  |
| eu-central-1 | 0.423 |  |
| eu-central-2 | 0.436 |  |
| eu-north-1 | 0.474 |  |
| eu-south-1 | 0.450 |  |
| eu-south-2 | 0.452 |  |
| eu-west-1 | 0.342 |  |
| eu-west-2 | 0.373 |  |
| eu-west-3 | 0.405 |  |
| il-central-1 | 0.615 |  |
| me-central-1 | 0.791 |  |
| me-south-1 | 0.748 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.512 |  |
| us-east-1 | 0.079 | 4308 |
| us-east-2 | 0.103 | 1434 |
| us-gov-east-1 | 0.112 | 1586 |
| us-gov-west-1 | 0.276 | 189 |
| us-west-1 | 0.236 | 3253 |
| us-west-2 | 0.277 | 148 |


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
Updated: 2026-03-30T01:48:44.172672+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.890 |  |
| ap-east-1 | 0.786 |  |
| ap-east-2 | 0.720 |  |
| ap-northeast-1 | 0.604 |  |
| ap-northeast-2 | 0.718 |  |
| ap-northeast-3 | 0.629 |  |
| ap-south-1 | 0.847 |  |
| ap-south-2 | 0.958 |  |
| ap-southeast-1 | 0.863 |  |
| ap-southeast-2 | 0.778 |  |
| ap-southeast-3 | 0.922 |  |
| ap-southeast-4 | 0.822 |  |
| ap-southeast-5 | 0.890 |  |
| ap-southeast-6 | 0.805 |  |
| ap-southeast-7 | 0.972 |  |
| ca-central-1 | 0.101 | 16 |
| ca-west-1 | 0.276 |  |
| eu-central-1 | 0.399 |  |
| eu-central-2 | 0.420 |  |
| eu-north-1 | 0.461 |  |
| eu-south-1 | 0.430 |  |
| eu-south-2 | 0.459 |  |
| eu-west-1 | 0.334 |  |
| eu-west-2 | 0.364 |  |
| eu-west-3 | 0.382 |  |
| il-central-1 | 0.579 |  |
| me-central-1 | 0.780 |  |
| me-south-1 | 0.759 |  |
| mx-central-1 | 0.230 |  |
| sa-east-1 | 0.512 |  |
| us-east-1 | 0.064 | 4396 |
| us-east-2 | 0.074 | 1466 |
| us-gov-east-1 | 0.081 | 1615 |
| us-gov-west-1 | 0.297 | 190 |
| us-west-1 | 0.245 | 3317 |
| us-west-2 | 0.297 | 152 |


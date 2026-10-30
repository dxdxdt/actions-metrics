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
Updated: 2026-10-30T03:45:07.610305+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.731 |  |
| ap-east-1 | 0.528 |  |
| ap-east-2 | 0.484 |  |
| ap-northeast-1 | 0.396 |  |
| ap-northeast-2 | 0.477 |  |
| ap-northeast-3 | 0.412 |  |
| ap-south-1 | 0.678 |  |
| ap-south-2 | 0.744 |  |
| ap-southeast-1 | 0.590 |  |
| ap-southeast-2 | 0.514 |  |
| ap-southeast-3 | 0.629 |  |
| ap-southeast-4 | 0.574 |  |
| ap-southeast-5 | 0.603 |  |
| ap-southeast-6 | 0.538 |  |
| ap-southeast-7 | 0.664 |  |
| ca-central-1 | 0.144 | 18 |
| ca-west-1 | 0.152 |  |
| eu-central-1 | 0.369 |  |
| eu-central-2 | 0.392 |  |
| eu-north-1 | 0.399 |  |
| eu-south-1 | 0.380 |  |
| eu-south-2 | 0.382 |  |
| eu-west-1 | 0.318 |  |
| eu-west-2 | 0.341 |  |
| eu-west-3 | 0.349 |  |
| il-central-1 | 0.489 |  |
| me-central-1 | 0.638 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.143 |  |
| sa-east-1 | 0.456 |  |
| us-east-1 | 0.113 | 5166 |
| us-east-2 | 0.101 | 1715 |
| us-gov-east-1 | 0.111 | 1956 |
| us-gov-west-1 | 0.154 | 240 |
| us-west-1 | 0.110 | 4201 |
| us-west-2 | 0.153 | 195 |


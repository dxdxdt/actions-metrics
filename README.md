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
Updated: 2026-03-31T09:58:00.174035+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.918 |  |
| ap-east-1 | 0.770 |  |
| ap-east-2 | 0.720 |  |
| ap-northeast-1 | 0.597 |  |
| ap-northeast-2 | 0.703 |  |
| ap-northeast-3 | 0.621 |  |
| ap-south-1 | 0.877 |  |
| ap-south-2 | 0.929 |  |
| ap-southeast-1 | 0.847 |  |
| ap-southeast-2 | 0.758 |  |
| ap-southeast-3 | 0.900 |  |
| ap-southeast-4 | 0.802 |  |
| ap-southeast-5 | 0.865 |  |
| ap-southeast-6 | 0.812 |  |
| ap-southeast-7 | 0.969 |  |
| ca-central-1 | 0.112 | 16 |
| ca-west-1 | 0.236 |  |
| eu-central-1 | 0.435 |  |
| eu-central-2 | 0.448 |  |
| eu-north-1 | 0.487 |  |
| eu-south-1 | 0.457 |  |
| eu-south-2 | 0.469 |  |
| eu-west-1 | 0.359 |  |
| eu-west-2 | 0.394 |  |
| eu-west-3 | 0.416 |  |
| il-central-1 | 0.608 |  |
| me-central-1 | 0.804 |  |
| me-south-1 | 0.772 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.537 |  |
| us-east-1 | 0.079 | 4405 |
| us-east-2 | 0.068 | 1469 |
| us-gov-east-1 | 0.072 | 1616 |
| us-gov-west-1 | 0.279 | 190 |
| us-west-1 | 0.225 | 3324 |
| us-west-2 | 0.280 | 152 |


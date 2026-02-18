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
Updated: 2026-02-18T22:25:48.982284+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.961 |  |
| ap-east-1 | 0.736 |  |
| ap-east-2 | 0.675 |  |
| ap-northeast-1 | 0.565 |  |
| ap-northeast-2 | 0.676 |  |
| ap-northeast-3 | 0.585 |  |
| ap-south-1 | 0.900 |  |
| ap-south-2 | 0.912 |  |
| ap-southeast-1 | 0.815 |  |
| ap-southeast-2 | 0.729 |  |
| ap-southeast-3 | 0.871 |  |
| ap-southeast-4 | 0.767 |  |
| ap-southeast-5 | 0.841 |  |
| ap-southeast-6 | 0.786 |  |
| ap-southeast-7 | 0.929 |  |
| ca-central-1 | 0.189 | 16 |
| ca-west-1 | 0.270 |  |
| eu-central-1 | 0.472 |  |
| eu-central-2 | 0.495 |  |
| eu-north-1 | 0.528 |  |
| eu-south-1 | 0.501 |  |
| eu-south-2 | 0.511 |  |
| eu-west-1 | 0.395 |  |
| eu-west-2 | 0.433 |  |
| eu-west-3 | 0.457 |  |
| il-central-1 | 0.659 |  |
| me-central-1 | 0.865 |  |
| me-south-1 | 0.822 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.569 |  |
| us-east-1 | 0.139 | 4140 |
| us-east-2 | 0.138 | 1354 |
| us-gov-east-1 | 0.146 | 1491 |
| us-gov-west-1 | 0.252 | 155 |
| us-west-1 | 0.205 | 3076 |
| us-west-2 | 0.252 | 128 |


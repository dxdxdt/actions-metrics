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
Updated: 2026-04-12T06:20:58.956851+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.931 |  |
| ap-east-1 | 0.738 |  |
| ap-east-2 | 0.673 |  |
| ap-northeast-1 | 0.564 |  |
| ap-northeast-2 | 0.669 |  |
| ap-northeast-3 | 0.591 |  |
| ap-south-1 | 0.867 |  |
| ap-south-2 | 0.903 |  |
| ap-southeast-1 | 0.822 |  |
| ap-southeast-2 | 0.738 |  |
| ap-southeast-3 | 0.882 |  |
| ap-southeast-4 | 0.778 |  |
| ap-southeast-5 | 0.844 |  |
| ap-southeast-6 | 0.805 |  |
| ap-southeast-7 | 0.919 |  |
| ca-central-1 | 0.181 | 16 |
| ca-west-1 | 0.263 |  |
| eu-central-1 | 0.441 |  |
| eu-central-2 | 0.472 |  |
| eu-north-1 | 0.503 |  |
| eu-south-1 | 0.478 |  |
| eu-south-2 | 0.477 |  |
| eu-west-1 | 0.369 |  |
| eu-west-2 | 0.416 |  |
| eu-west-3 | 0.420 |  |
| il-central-1 | 0.620 |  |
| me-central-1 | 0.817 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.547 |  |
| us-east-1 | 0.117 | 4485 |
| us-east-2 | 0.151 | 1495 |
| us-gov-east-1 | 0.141 | 1642 |
| us-gov-west-1 | 0.277 | 192 |
| us-west-1 | 0.195 | 3398 |
| us-west-2 | 0.272 | 155 |


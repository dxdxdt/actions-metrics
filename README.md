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
Updated: 2026-02-27T18:32:19.550717+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.005 |  |
| ap-east-1 | 0.689 |  |
| ap-east-2 | 0.623 |  |
| ap-northeast-1 | 0.507 |  |
| ap-northeast-2 | 0.612 |  |
| ap-northeast-3 | 0.531 |  |
| ap-south-1 | 0.940 |  |
| ap-south-2 | 0.942 |  |
| ap-southeast-1 | 0.762 |  |
| ap-southeast-2 | 0.666 |  |
| ap-southeast-3 | 0.820 |  |
| ap-southeast-4 | 0.709 |  |
| ap-southeast-5 | 0.786 |  |
| ap-southeast-6 | 0.751 |  |
| ap-southeast-7 | 0.868 |  |
| ca-central-1 | 0.206 | 16 |
| ca-west-1 | 0.209 |  |
| eu-central-1 | 0.521 |  |
| eu-central-2 | 0.534 |  |
| eu-north-1 | 0.573 |  |
| eu-south-1 | 0.538 |  |
| eu-south-2 | 0.554 |  |
| eu-west-1 | 0.451 |  |
| eu-west-2 | 0.490 |  |
| eu-west-3 | 0.500 |  |
| il-central-1 | 0.703 |  |
| me-central-1 | 0.885 |  |
| me-south-1 | 0.865 |  |
| mx-central-1 | 0.210 |  |
| sa-east-1 | 0.631 |  |
| us-east-1 | 0.162 | 4194 |
| us-east-2 | 0.159 | 1382 |
| us-gov-east-1 | 0.143 | 1516 |
| us-gov-west-1 | 0.177 | 162 |
| us-west-1 | 0.160 | 3135 |
| us-west-2 | 0.176 | 133 |


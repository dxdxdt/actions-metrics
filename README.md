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
Updated: 2026-03-18T08:39:27.690346+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.931 |  |
| ap-east-1 | 0.759 |  |
| ap-east-2 | 0.702 |  |
| ap-northeast-1 | 0.580 |  |
| ap-northeast-2 | 0.693 |  |
| ap-northeast-3 | 0.613 |  |
| ap-south-1 | 0.927 |  |
| ap-south-2 | 0.966 |  |
| ap-southeast-1 | 0.837 |  |
| ap-southeast-2 | 0.744 |  |
| ap-southeast-3 | 0.891 |  |
| ap-southeast-4 | 0.784 |  |
| ap-southeast-5 | 0.859 |  |
| ap-southeast-6 | 0.781 |  |
| ap-southeast-7 | 0.943 |  |
| ca-central-1 | 0.122 | 16 |
| ca-west-1 | 0.254 |  |
| eu-central-1 | 0.438 |  |
| eu-central-2 | 0.460 |  |
| eu-north-1 | 0.492 |  |
| eu-south-1 | 0.470 |  |
| eu-south-2 | 0.475 |  |
| eu-west-1 | 0.363 |  |
| eu-west-2 | 0.394 |  |
| eu-west-3 | 0.417 |  |
| il-central-1 | 0.600 |  |
| me-central-1 | 0.810 |  |
| me-south-1 | 0.770 |  |
| mx-central-1 | 0.222 |  |
| sa-east-1 | 0.534 |  |
| us-east-1 | 0.089 | 4300 |
| us-east-2 | 0.087 | 1432 |
| us-gov-east-1 | 0.085 | 1586 |
| us-gov-west-1 | 0.252 | 189 |
| us-west-1 | 0.238 | 3249 |
| us-west-2 | 0.247 | 148 |


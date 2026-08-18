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
Updated: 2026-08-18T03:37:57.384211+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.975 |  |
| ap-east-1 | 0.708 |  |
| ap-east-2 | 0.647 |  |
| ap-northeast-1 | 0.531 |  |
| ap-northeast-2 | 0.631 |  |
| ap-northeast-3 | 0.556 |  |
| ap-south-1 | 0.903 |  |
| ap-south-2 | 0.957 |  |
| ap-southeast-1 | 0.784 |  |
| ap-southeast-2 | 0.688 |  |
| ap-southeast-3 | 0.842 |  |
| ap-southeast-4 | 0.730 |  |
| ap-southeast-5 | 0.803 |  |
| ap-southeast-6 | 0.710 |  |
| ap-southeast-7 | 0.887 |  |
| ca-central-1 | 0.170 | 18 |
| ca-west-1 | 0.222 |  |
| eu-central-1 | 0.485 |  |
| eu-central-2 | 0.510 |  |
| eu-north-1 | 0.529 |  |
| eu-south-1 | 0.508 |  |
| eu-south-2 | 0.520 |  |
| eu-west-1 | 0.402 |  |
| eu-west-2 | 0.440 |  |
| eu-west-3 | 0.472 |  |
| il-central-1 | 0.629 |  |
| me-central-1 | 0.842 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.243 |  |
| sa-east-1 | 0.609 |  |
| us-east-1 | 0.139 | 5014 |
| us-east-2 | 0.144 | 1680 |
| us-gov-east-1 | 0.115 | 1842 |
| us-gov-west-1 | 0.204 | 224 |
| us-west-1 | 0.146 | 3983 |
| us-west-2 | 0.204 | 181 |


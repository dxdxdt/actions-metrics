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
Updated: 2026-05-23T15:57:34.416685+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.905 |  |
| ap-east-1 | 0.784 |  |
| ap-east-2 | 0.717 |  |
| ap-northeast-1 | 0.606 |  |
| ap-northeast-2 | 0.716 |  |
| ap-northeast-3 | 0.633 |  |
| ap-south-1 | 0.841 |  |
| ap-south-2 | 0.885 |  |
| ap-southeast-1 | 0.855 |  |
| ap-southeast-2 | 0.780 |  |
| ap-southeast-3 | 0.917 |  |
| ap-southeast-4 | 0.822 |  |
| ap-southeast-5 | 0.876 |  |
| ap-southeast-6 | 0.810 |  |
| ap-southeast-7 | 0.966 |  |
| ca-central-1 | 0.109 | 16 |
| ca-west-1 | 0.255 |  |
| eu-central-1 | 0.423 |  |
| eu-central-2 | 0.437 |  |
| eu-north-1 | 0.461 |  |
| eu-south-1 | 0.446 |  |
| eu-south-2 | 0.457 |  |
| eu-west-1 | 0.338 |  |
| eu-west-2 | 0.373 |  |
| eu-west-3 | 0.400 |  |
| il-central-1 | 0.573 |  |
| me-central-1 | 0.794 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.229 |  |
| sa-east-1 | 0.520 |  |
| us-east-1 | 0.076 | 4680 |
| us-east-2 | 0.082 | 1607 |
| us-gov-east-1 | 0.082 | 1703 |
| us-gov-west-1 | 0.285 | 195 |
| us-west-1 | 0.229 | 3589 |
| us-west-2 | 0.285 | 159 |

